import './main.css';
import { Elm } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const STORAGE_KEY = 'elmodoro-settings';
const DEFAULT_SETTINGS = { pomodoroMinutes: 25, shortBreakMinutes: 5, longBreakMinutes: 15 };

function loadSettings() {
  try {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored) {
      const parsed = JSON.parse(stored);
      const validInt = (v, fallback) =>
        Number.isInteger(v) && v >= 1 ? v : fallback;
      return {
        pomodoroMinutes:   validInt(parsed.pomodoroMinutes,   DEFAULT_SETTINGS.pomodoroMinutes),
        shortBreakMinutes: validInt(parsed.shortBreakMinutes, DEFAULT_SETTINGS.shortBreakMinutes),
        longBreakMinutes:  validInt(parsed.longBreakMinutes,  DEFAULT_SETTINGS.longBreakMinutes),
      };
    }
  } catch (e) {
    // Ignore errors (private browsing, corrupted data, etc.)
  }
  return { ...DEFAULT_SETTINGS };
}

const app = Elm.Main.init({
  node: document.getElementById('root'),
  flags: loadSettings()
});

registerServiceWorker();

// Request notification permission on page load
if ('Notification' in window && Notification.permission === 'default') {
  Notification.requestPermission().catch(err => {
    console.warn('Notification permission failed', err);
  });
}

// Cache and reuse audio to avoid new decodes; clone so overlapping plays work.
const sound = new Audio('/sound.mp3');
sound.preload = 'auto';

// Try to satisfy autoplay policies by priming audio on the first user gesture.
let audioPrimed = false;
const primeAudio = async () => {
  if (audioPrimed) return;
  audioPrimed = true;
  try {
    // Play silently once to unlock playback, then pause.
    sound.volume = 0.001;
    const clip = sound.cloneNode(true);
    clip.volume = 0.001;
    await clip.play();
    clip.pause();
  } catch (err) {
    console.warn('Audio prime failed', err);
  } finally {
    sound.volume = 1;
  }
};

['click', 'touchstart', 'keydown'].forEach(evt => {
  window.addEventListener(evt, primeAudio, { once: true, passive: true });
});

async function playAlarm() {
  try {
    const clip = sound.cloneNode(true);
    await clip.play();
  } catch (err) {
    // Ignore autoplay/gesture blocks; notification fallback still runs.
    console.warn('Audio playback blocked or failed', err);
  }
}

async function notifyAlarm() {
  if (!('Notification' in window)) return;
  if (Notification.permission !== 'granted') return;

  try {
    const registration = await navigator.serviceWorker?.ready;
    if (registration?.showNotification) {
      registration.showNotification('Elmodoro', {
        body: 'Time is up! 🎉',
        tag: 'elmodoro-timer',
        renotify: true,
        requireInteraction: true,
        vibrate: [150, 75, 150]
      });
      return;
    }
  } catch (err) {
    console.warn('Service worker notification failed', err);
  }

  try {
    new Notification('Elmodoro', { body: 'Time is up!' });
  } catch (err) {
    console.warn('Notification failed', err);
  }
}

app.ports.playSound.subscribe(() => {
  playAlarm();
  notifyAlarm();
});

// JavaScript-driven timer that resists throttling better than Elm's Time.every
let timerInterval = null;

app.ports.setTimerActive.subscribe((active) => {
  if (timerInterval) {
    clearInterval(timerInterval);
    timerInterval = null;
  }
  
  if (active) {
    // Update every 200ms to keep title fresh even when throttled
    timerInterval = setInterval(() => {
      app.ports.timerTick.send(Date.now());
    }, 200);
  }
});

// Send immediate update when tab becomes visible
document.addEventListener('visibilitychange', () => {
  if (!document.hidden) {
    app.ports.visibilityTick.send(Date.now());
  }
});

app.ports.saveSettings.subscribe((settings) => {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(settings));
  } catch (e) {
    console.warn('Failed to save settings to localStorage', e);
  }
});
