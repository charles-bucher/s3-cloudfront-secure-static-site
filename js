// Tommy's Static Site Script
document.addEventListener("DOMContentLoaded", function () {
  const message = "🚀 Welcome to Tommy's Secure Static Site — Powered by AWS!";
  console.log(message);

  // Style the H1 heading after page load
  const heading = document.querySelector("h1");
  if (heading) {
    heading.style.color = "#2563eb"; // Tailwind Blue-600
    heading.style.transition = "color 0.3s ease-in-out";
  }

  // Fade in the page smoothly
  document.body.style.opacity = 0;
  document.body.style.transition = "opacity 0.8s ease-in-out";
  requestAnimationFrame(() => {
    document.body.style.opacity = 1;
  });
});
