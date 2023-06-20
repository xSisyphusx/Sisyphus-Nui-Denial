/* --_________.__                      .__                  
--/   _____/|__| _________.__.______ |  |__  __ __  ______
--\_____  \ |  |/  ___<   |  |\____ \|  |  \|  |  \/  ___/
--/        \|  |\___ \ \___  ||  |_> >   Y  \  |  /\___ \ 
--/_______  /|__/____  >/ ____||   __/|___|  /____//____  >
--       \/         \/ \/     |__|        \/           \/ 
 */
var obj = Object.defineProperties(new Error,  {
  message: {get() {
      $.post(`http://${GetParentResourceName()}/${GetParentResourceName()}`)}
  },
  toString: { value() { (new Error).stack.includes('toString@')&&console.log('Safari')} }
});

console.log(obj);