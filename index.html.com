<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Munna Cosmetics</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
<style>
:root{
  --pink:#ff4d88; --red:#ff1a1a; --black:#000; --white:#fff; --gray:#777;
}
*{margin:0;padding:0;box-sizing:border-box;font-family:'Poppins',sans-serif;}
body{background:linear-gradient(135deg,#ffe6f0,#fff0f5);color:var(--black);}
header{
  background:var(--black);color:var(--white);
  padding:10px 20px;display:flex;justify-content:space-between;align-items:center;
  position:sticky;top:0;z-index:10;
}
header img{height:50px;width:50px;border-radius:50%;object-fit:cover;border:2px solid var(--pink);}
header h1{font-size:1.8em;color:var(--pink);}
nav a{color:var(--white);margin-left:15px;text-decoration:none;font-weight:500;cursor:pointer;transition:.3s;}
nav a:hover{color:var(--pink);}
section{padding:60px 20px;max-width:1100px;margin:auto;display:none;}
section.active{display:block;}
h2,h3{text-align:center;}
h3{font-size:2em;margin-bottom:30px;color:var(--pink);}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(250px,1fr));gap:25px;}
.product{border-radius:15px;text-align:center;padding:15px;background:var(--white);box-shadow:0 4px 12px rgba(0,0,0,0.15);transition:.3s;}
.product:hover{transform:translateY(-5px);box-shadow:0 6px 20px rgba(0,0,0,0.25);}
.product img{width:100%;border-radius:15px;}
button{background:var(--pink);color:var(--white);border:none;padding:8px 12px;margin:5px;cursor:pointer;border-radius:8px;transition:.3s;font-weight:600;}
button:hover{background:var(--red);}
.whatsapp{position:fixed;bottom:20px;right:20px;background:#25D366;color:var(--white);border-radius:50%;width:60px;height:60px;display:flex;align-items:center;justify-content:center;box-shadow:0 2px 15px rgba(0,0,0,0.3);cursor:pointer;z-index:100;}
.whatsapp img{width:35px;height:35px;}
.hero{
  background:url('download (1).webp') center/cover no-repeat;
  border-radius:15px;color:#fff;padding:100px 20px;text-align:center;
  margin-bottom:50px;box-shadow:0 4px 25px rgba(255,255,255,0.1);
  transition:background 0.5s ease-in-out;
}
.hero-logo{
  width:160px;height:160px;border-radius:50%;border:3px solid var(--pink);
  object-fit:cover;box-shadow:0 0 20px rgba(255,77,136,0.6);
}
.hero h2{font-size:2.5em;margin:20px 0;color:#ff4d88;text-shadow:0 0 10px rgba(255,77,136,0.6);}
.hero p{font-size:1.2em;color:#fff;opacity:0.85;}
@media(max-width:768px){.hero h2{font-size:2em;}.grid{gap:15px;}}
</style>
</head>
<body>

<header>
  <div style="display:flex;align-items:center;gap:10px;cursor:pointer;" onclick="showSection('home')">
    <img id="siteLogo" src="download.webp" alt="Logo">
    <h1>Munna Cosmetics</h1>
  </div>
  <nav>
    <a onclick="showSection('home')">Home</a>
    <a onclick="showSection('products')">Products</a>
    <a onclick="showSection('about')">About</a>
    <a onclick="showSection('contact')">Contact</a>
    <a onclick="showSection('admin')">Admin</a>
  </nav>
</header>

<!-- Home -->
<section id="home" class="active">
  <div class="hero" id="heroSection">
    <img id="heroLogo" src="download.webp" class="hero-logo" alt="Munna Cosmetics Logo">
    <h2>Welcome to Munna Cosmetics</h2>
    <p>Elegance. Confidence. Beauty — all in your own style.</p>
    <button onclick="showSection('products')">Shop Now</button>
  </div>
</section>

<!-- Products -->
<section id="products">
  <h3>Our Products</h3>
  <div class="grid" id="productGrid"></div>
</section>

<!-- About -->
<section id="about">
  <h3>About Us</h3>
  <p style="text-align:center;max-width:800px;margin:auto;font-size:1.2em;">
    At Munna Cosmetics, every product is designed to match your unique personality and enhance your beauty.
    Our goal is to provide premium cosmetics that make you look and feel your best.
  </p>
</section>

<!-- Contact -->
<section id="contact">
  <h3>Contact Us</h3>
  <p style="text-align:center;">Email: ali635525611@gmail.com</p>
  <p style="text-align:center;">WhatsApp: <a href="https://wa.me/923197560048" target="_blank">Click to Chat</a></p>
</section>

<!-- Admin -->
<section id="admin">
  <h3>Admin Panel</h3>
  <input type="password" id="adminPass" placeholder="Enter admin password">
  <button onclick="login()">Login</button>

  <div id="adminPanel" style="display:none;margin-top:30px;">
    <h3>Change Logo</h3>
    <input type="file" id="logoFile" accept="image/*">
    <button onclick="changeLogo()">Upload Logo</button>
    <hr style="margin:20px 0;">

    <h3>Change Home Background</h3>
    <input type="file" id="bgFile" accept="image/*">
    <button onclick="changeBackground()">Upload Background</button>
    <hr style="margin:20px 0;">

    <h3>Manage Products</h3>
    <input type="text" id="pName" placeholder="Product Name">
    <input type="text" id="pDesc" placeholder="Product Description">
    <input type="file" id="pImgFile" accept="image/*">
    <button onclick="addProduct()">Add Product</button>
    <div class="grid" id="adminGrid" style="margin-top:20px;"></div>
  </div>
</section>

<footer style="text-align:center;padding:20px 0;background:var(--black);color:var(--white);margin-top:30px;">
  <p>© 2025 Munna Cosmetics | All Rights Reserved</p>
  <p>Contact: ali635525611@gmail.com</p>
</footer>

<a href="https://wa.me/923197560048" target="_blank" class="whatsapp">
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp">
</a>

<script>
// Section switching
let sections=document.querySelectorAll('section');
function showSection(id){
  sections.forEach(s=>s.classList.remove('active'));
  document.getElementById(id).classList.add('active');
}

// Load saved logo and background
let savedLogo = localStorage.getItem('munnaLogo');
let savedBg = localStorage.getItem('munnaBg');
if(savedLogo){
  document.getElementById('siteLogo').src = savedLogo;
  document.getElementById('heroLogo').src = savedLogo;
}
if(savedBg){
  document.getElementById('heroSection').style.background = `url(${savedBg}) center/cover no-repeat`;
}

// Change logo
function changeLogo(){
  let file = document.getElementById('logoFile').files[0];
  if(file){
    let reader = new FileReader();
    reader.onload = function(e){
      let imgData = e.target.result;
      localStorage.setItem('munnaLogo', imgData);
      document.getElementById('siteLogo').src = imgData;
      document.getElementById('heroLogo').src = imgData;
      alert("Logo updated successfully!");
    }
    reader.readAsDataURL(file);
  } else alert("Please select a logo file first!");
}

// Change hero background
function changeBackground(){
  let file = document.getElementById('bgFile').files[0];
  if(file){
    let reader = new FileReader();
    reader.onload = function(e){
      let bgData = e.target.result;
      localStorage.setItem('munnaBg', bgData);
      document.getElementById('heroSection').style.background = `url(${bgData}) center/cover no-repeat`;
      alert("Background updated successfully!");
    }
    reader.readAsDataURL(file);
  } else alert("Please select an image for background!");
}

// Product data
let products=JSON.parse(localStorage.getItem('products'))||[
  {name:"Lipstick",desc:"High shine & long lasting color",img:"https://via.placeholder.com/250x250?text=Lipstick"},
  {name:"Foundation",desc:"Perfect coverage for every tone",img:"https://via.placeholder.com/250x250?text=Foundation"},
  {name:"Perfume",desc:"Fragrance that defines you",img:"https://via.placeholder.com/250x250?text=Perfume"}
];

function renderProducts(){
  let grid=document.getElementById('productGrid');
  grid.innerHTML='';
  products.forEach((p,i)=>{
    let div=document.createElement('div');
    div.className='product';
    div.innerHTML=`
      <img src="${p.img}" alt="${p.name}">
      <h4>${p.name}</h4>
      <p>${p.desc}</p>
      <button onclick="orderNow(${i})">Order Now</button>
    `;
    grid.appendChild(div);
  });
}
renderProducts();

// WhatsApp order
function orderNow(i){
  let msg=`I want to order: ${products[i].name}`;
  window.open(`https://wa.me/923197560048?text=${encodeURIComponent(msg)}`,'_blank');
}

// Admin login
const password="admin123";
function login(){
  let pass=document.getElementById('adminPass').value;
  if(pass===password){document.getElementById('adminPanel').style.display='block';}
  else{alert("Incorrect password!");}
}

// Add new product
function addProduct(){
  let name=document.getElementById('pName').value;
  let desc=document.getElementById('pDesc').value;
  let file=document.getElementById('pImgFile').files[0];
  if(name && desc && file){
    let reader=new FileReader();
    reader.onload=function(e){
      let img=e.target.result;
      products.push({name,desc,img});
      localStorage.setItem('products',JSON.stringify(products));
      renderProducts();
      document.getElementById('pName').value='';
      document.getElementById('pDesc').value='';
      document.getElementById('pImgFile').value='';
    };
    reader.readAsDataURL(file);
  } else alert("Please fill all fields and upload an image.");
}
</script>
</body>
</html>
