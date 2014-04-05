open ZMQ;;
open ZMQ.Socket;;

let context = init () in
let responder = Socket.create context rep in
bind responder "tcp://*:5555";

while true do
  let request = recv responder in
  Printf.printf "(%s) Received request: [%s]\n%!" (Unix.gethostname()) request;
  send responder ("(" ^ (Unix.gethostname()) ^ ") Word")
done;

close responder;
term context
