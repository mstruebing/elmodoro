import './main.css';
import { Elm } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const app = Elm.Main.init({
  node: document.getElementById('root')
});

registerServiceWorker();

app.ports.playSound.subscribe(() => {
    new Audio('/sound.mp3').play();
});
