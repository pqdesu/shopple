import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.onScroll = () => {
      if (window.innerWidth >= 768) {
        const scrollY = window.scrollY;
        const viewportHeight = window.innerHeight;

        const baseHeightVh = 60;
        const baseHeight = (viewportHeight * baseHeightVh) / 100;
        const newHeight = baseHeight + scrollY * 0.3;

        const maxHeight = viewportHeight * 0.9;
        const finalHeight = Math.min(maxHeight, newHeight);

        this.element.style.height = `${finalHeight}px`;
      } else {
        // Reset height on mobile
        this.element.style.height = "auto";
      }
    };

    window.addEventListener("scroll", this.onScroll);
    window.addEventListener("resize", this.onScroll);
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll);
    window.removeEventListener("resize", this.onScroll);
  }
}
