var term = require( 'terminal-kit' ).terminal ;
var WebSocket = require('ws')
var	ws = new WebSocket('https://qemugoogle-itycvsqjor.now.sh/', "wetty");
    
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
//        case 'UP' : term.up( 1 ) ; break ;
//        case 'DOWN' : term.down( 1 ) ; break ;
//        case 'LEFT' : term.left( 1 ) ; break ;
//        case 'RIGHT' : term.right( 1 ) ; break ;
		case 'CTRL_P' : process.exit() ; break ;
		case 'ENTER': 
			ws.send(JSON.stringify({ 
				data: 
				   "\r" }) 
			);
			break;
        default:   
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
