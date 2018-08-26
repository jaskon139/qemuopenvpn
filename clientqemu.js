var term = require( 'terminal-kit' ).terminal ;
var WebSocket = require('ws')
var	ws = new WebSocket('wss://qemugoogle-itycvsqjor.now.sh/', "wetty");
//var	ws = new WebSocket('ws://192.168.56.3:3100/', "wetty");

term( 'The terminal size is %dx%d\n' , term.width , term.height ) ;

ws.onopen = function () {
       console.log('websocket is connected ...')

       // sending a send event to websocket server
       ws.send(JSON.stringify({
           rowcol: true,
           col: term.width,
           row: term.height
       }));
   }


ws.onmessage = function(msg) {
    if (!msg || !msg.data)
        return;
    var data = JSON.parse(msg.data);
	term( data.data );
	//console.log(data.data);
}

ws.onerror = function(e) {
    console.log("WebSocket connection error");
}
ws.onclose = function() {
    console.log("WebSocket connection closed");
}

term.grabInput( { mouse: 'button' } ) ;

term.on( 'key' , function( key , matches , data ) {

    switch ( key )
    {
        case 'UP' :
			ws.send(JSON.stringify({ 
				data: "\u001b[A"
				})
			);
		break ;
//        case 'DOWN' : term.down( 1 ) ; break ;
//        case 'LEFT' : term.left( 1 ) ; break ;
//        case 'RIGHT' : term.right( 1 ) ; break ;
		case 'CTRL_P' : process.exit() ; break ;
		case 'CTRL_C' :
			ws.send(JSON.stringify({ 
				data: "\u0003" }) 
			);
			break;
		case 'ENTER': 
			ws.send(JSON.stringify({ 
				data: 
				   "\r" }) 
			);
			break;
        default:   
//			console.log("ttt = " +  "\\u"+parseInt( String.fromCharCode(data.code).charCodeAt(0),10).toString(16) );
            // Echo anything else
//            term.noFormat(
//                Buffer.isBuffer( data.code ) ?
//                    data.code :
//                    String.fromCharCode( data.code )
//            ) ;

			ws.send(JSON.stringify({ 
				data: 
				   Buffer.isBuffer( data.code ) ?
                   data.code :
                   String.fromCharCode( data.code ) }) 
			);
            break ;
    }
} ) ;
