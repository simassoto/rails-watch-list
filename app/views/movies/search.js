const API_URL =
'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=233f0fa9cdf2508b0ce55ce88a98563e&page=1';

const IMAGE_PATH = "http://image.tmdb.org/t/p/w1280";

const SEARCH_URL =
'https://api.themoviedb.org/3/search/movie?api_key=233f0fa9cdf2508b0ce55ce88a98563e&query="';
const form=document.getElementById('form')
const search=document.getElementById('search')
const main=document.getElementById('main')

//Get Movies
getMovies(API_URL)
async function getMovies(url){
const res= await fetch(url)
const data= await res.json()
console.log(data.results);
}
function displayMovies(movies){
  main.innerHTML=''
  movies.forEach((movie) => {
    const {title,poster_path,vote_average,overview}=movie
    moviesElement=document.innerHTML='
    <img src="${IMAGE_PATH} + ${poster_path}" alt="${title}" />
    <div class= 'movie-info'>
      <h3>${title}</h3>
      <span class=""> ${vote_average}</span>
      <div class= 'overview'>
        <h3>Overview</h3>
      </div>
    </div>
    '
    main.appendChild(moviesElement)
  })
}
form.addEventListener('submit', (e)=>{
  e.preventDefault()
  const searchValue=search.ariaValue
  if(searchValue && searchValue !==''){
    getMovies(SEARCH_URL+searchValue)
    searchValue=''
  }else{
    window.location.reload()
  }

})
