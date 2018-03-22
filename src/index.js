import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const app = Main.embed(document.getElementById('root'));

registerServiceWorker();

app.ports.setTitle.subscribe(title => {
    document.title = title;
});

app.ports.playSound.subscribe(_ => {
    new Audio('/sound.mp3').play();
});
