// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// live viewwwww
import {Socket} from "phoenix";
import LiveSocket from "phoenix_live_view";

let currentJs = '';

let Hooks = {};

// one of each hook for experimentation!
Hooks.TestHook = {
  mounted() {
    console.log('element mounted');
    console.log(this.el.value);
    },
    updated() {
      console.log('element updated');
      console.log(this.el.value);
    },
    destroyed() {
      console.log('element destroyed!');
      console.log(this.el.value);
    },
    disconnected() {
      console.log('element disconnected');
      console.log(this.el.value);
    },
    reconnected() {
      console.log('element reconnected');
      console.log(this.el.value);
    }
  };



// For the JS editor to work, this needs to be a hook.
// Just editing innerHTML won't execute a script tag, and that's
// how LiveView is updating the DOM.
Hooks.JavaScriptExecuter = {
  mounted() {
    console.log('js element mounted');
    console.log(this.el.value);
  },
  updated() {
    // updated hook is run whenever the form changes,
    // only try to execute the JS if the JS was changed
    if (currentJs == this.el.value) { return; }

    try {
      currentJs = this.el.value;
      eval(this.el.value); // eval is spooky don't ever actually do this!
      console.log(`executed: ${this.el.value}`);
    }
    catch(error) {
      console.log('cannot run this as JS (yet...)');
    };
  }
}

window.liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks})
console.log(liveSocket);
window.liveSocket.connect();
