import { Socket } from "phoenix";

let socket = new Socket("/socket", { params: { userToken: "123" } });

socket.connect();
export default socket;
