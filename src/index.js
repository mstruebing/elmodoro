import './main.css';
import { Elm } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const app = Elm.Main.init({
  node: document.getElementById('root')
});

registerServiceWorker();

// Cache and reuse audio to avoid new decodes; clone so overlapping plays work.
const sound = new Audio('/sound.mp3');
sound.preload = 'auto';

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

  if (Notification.permission === 'default') {
    try {
      await Notification.requestPermission();
    } catch (err) {
      console.warn('Notification permission failed', err);
    }
  }

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
