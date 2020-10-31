
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = function() {
  const dogLinks = [];
  const dogNames = Object.keys(dogs); 
  
  dogNames.forEach(function(dogName) {
    const dog = document.createElement("a");
    dog.innerHTML = dogName;
    dog.href = dogs[dogName];

    const dogLink = document.createElement("li");
    dogLink.class = "dog-link";
    dogLink.appendChild(dog);
    dogLinks.push(dogLink);
  });

  return dogLinks;

}

const attachDogLinks = function() { //do we need to pass dogs in as arg
  const dogLinks = dogLinkCreator(); 
  dogLinks.forEach(function(dogLink) {
    document.querySelector(".drop-down-dog-list").appendChild(dogLink);
  })
}

attachDogLinks();

const handleEnter = function() {
  const dogUl = document.querySelector(".drop-down-dog-list");
  dogUl.classList.remove("hidden");
}


const handleLeave = function() {
  const dogUl = document.querySelector(".drop-down-dog-list");
  dogUl.classList.add("hidden");
}


const navButton = document.querySelector(".drop-down-dog-nav");

navButton.addEventListener("mouseenter", handleEnter);
navButton.addEventListener("mouseleave", handleLeave);


