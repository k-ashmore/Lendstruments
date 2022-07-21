// click on categories to see hidden search list items
const select = document.getElementById("select")
const list = document.getElementById("list")

select.addEventListener("click", () => {
  list.classList.toggle("open");
})

// to do show the form in the select bar when clicked, and later popular search bar
// is returning undefined sobs why
const selectText = document.getElementById("select-text")
const options = document.getElementsByClassName("options")
const inputField = document.getElementById("input-field")
// for ..  of is like for i in array in ruby
for (const option of options){
  option.addEventListener("click", () => {
    selectText.innerHTML = option.innerHTML;
    inputField.placeholder= "Search in " + selectText.innerHTML;
    console.log(this.innerHTML);
  })
}
