//
// $ nvm use < .nvmrc
// $ npm install --global antora
// $ node ./watch-antora.js
//

const { exec } = require('child_process');
const chokidar = require('chokidar');

const log = console.log.bind(console);

const watcher = chokidar.watch('..', {
  ignored: /build|node_modules|\.spago|\.git/,
  persistent: true,

  //
  // So no ‘add’ events are emitted for the initial
  // pass while instantiating the watching, which
  // would cause the command to run for thousands
  // of time and burn the CPU.
  //
  ignoreInitial: true,
});

function handleEvent(path, event) {
  log(path, event);
  exec('npx antora --fetch ./local-antora-playbook.yml');
}

watcher
  .on('add', handleEvent)
  .on('change', handleEvent)
  .on('unlink', handleEvent);

