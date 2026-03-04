(() => {
  const page = document.body.dataset.page || '';
  const navLinks = document.querySelectorAll('nav a[data-page]');

  navLinks.forEach((link) => {
    if (link.dataset.page === page) {
      link.setAttribute('aria-current', 'page');
    }
  });

  const yearNode = document.querySelector('[data-year]');
  if (yearNode) {
    yearNode.textContent = String(new Date().getFullYear());
  }

  const reveals = document.querySelectorAll('.reveal');

  const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (prefersReducedMotion) {
    reveals.forEach((el) => el.classList.add('in-view'));
    return;
  }

  // Immediately reveal elements already in the viewport
  const viewH = window.innerHeight;
  reveals.forEach((el) => {
    if (el.getBoundingClientRect().top < viewH) {
      el.classList.add('in-view');
    }
  });

  // Animate remaining elements as they scroll into view
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('in-view');
          observer.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.18, rootMargin: '0px 0px -30px 0px' }
  );

  reveals.forEach((el) => {
    if (!el.classList.contains('in-view')) {
      observer.observe(el);
    }
  });
})();
