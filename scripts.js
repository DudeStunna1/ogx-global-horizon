const audio = new Audio('assets/welcome.mp3');
let played=false;
function tryPlay(){
  if(!played){
    audio.play().catch(()=>{/* autoplay blocked */});
    played=true;
  }
}
document.addEventListener('DOMContentLoaded', ()=>{tryPlay();});
document.getElementById('muteBtn').addEventListener('click', ()=>{
  if(audio.muted){audio.muted=false; document.getElementById('muteBtn').innerText='Mute audio';}
  else{audio.muted=true; document.getElementById('muteBtn').innerText='Unmute audio';}
});
if('serviceWorker' in navigator){navigator.serviceWorker.register('./sw.js').then(()=>console.log('SW registered'));}