import { Socket } from "phoenix";

let socket = new Socket("/socket", {});

socket.connect();

export default socket;

const channel = socket.channel("ping")

channel.join()
  .receive("ok", resp => console.log("Joined ping", resp))
  .receive("error", resp => console.log("Unable to join ping", resp))

console.log("send ping")
channel.push("ping")
  .receive("ok", resp => console.log("receive", resp.ping))

console.log("send pong")
channel.push("pong")
  .receive("ok", resp => console.log("won't happen"))
  .receive("error", resp => console.error("won't happen yet"))
  .receive("timeout", resp => console.error("pong message timeout", resp))
