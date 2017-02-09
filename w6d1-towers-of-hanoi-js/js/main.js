const HanoiGame = require('./game.js');
const HanoiView = require('./view.js');


$( () => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  let view = new HanoiView(game, rootEl);
});
