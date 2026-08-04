/* Shared UI: nav + form honeypot + year */
(function () {
  var toggle = document.querySelector(".nav-toggle");
  var nav = document.querySelector(".nav");
  if (toggle && nav) {
    var label = toggle.querySelector(".nav-toggle-label");
    toggle.addEventListener("click", function () {
      var open = nav.classList.toggle("is-open");
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
      toggle.setAttribute("aria-label", open ? "Close menu" : "Open menu");
      if (label) label.textContent = open ? "Close" : "Menu";
    });
    // Close mobile menu after tapping a link
    nav.querySelectorAll("a").forEach(function (link) {
      link.addEventListener("click", function () {
        if (!nav.classList.contains("is-open")) return;
        nav.classList.remove("is-open");
        toggle.setAttribute("aria-expanded", "false");
        toggle.setAttribute("aria-label", "Open menu");
        if (label) label.textContent = "Menu";
      });
    });
  }

  document.querySelectorAll(".nav-drop-btn").forEach(function (btn) {
    btn.addEventListener("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      var drop = btn.closest(".nav-drop");
      var open = drop.classList.toggle("is-open");
      btn.setAttribute("aria-expanded", open ? "true" : "false");
    });
  });
  document.addEventListener("click", function (e) {
    if (!e.target.closest(".nav-drop")) {
      document.querySelectorAll(".nav-drop.is-open").forEach(function (d) {
        d.classList.remove("is-open");
        var b = d.querySelector(".nav-drop-btn");
        if (b) b.setAttribute("aria-expanded", "false");
      });
    }
  });

  document.querySelectorAll(".lead-form").forEach(function (form) {
    form.addEventListener("submit", function (e) {
      e.preventDefault();
      var hp = form.querySelector('[name="company_website"]');
      if (hp && hp.value) return;

      var started = form.getAttribute("data-started");
      if (started && Date.now() - Number(started) < 2500) {
        alert("Please take a moment and try again.");
        return;
      }

      var data = new FormData(form);
      var name = (data.get("name") || "").toString().trim();
      var phone = (data.get("phone") || "").toString().trim();
      var email = (data.get("email") || "").toString().trim();
      var interest = (data.get("interest") || "General").toString();
      var message = (data.get("message") || "").toString().trim();
      var page = location.pathname.split("/").pop() || "home";

      var action = (form.getAttribute("data-lofty-action") || "").trim();
      if (action) {
        form.setAttribute("action", action);
        form.setAttribute("method", "POST");
        form.submit();
        return;
      }

      var subject = encodeURIComponent("Website lead - " + interest + " - " + name);
      var body = encodeURIComponent(
        "Name: " + name + "\nPhone: " + phone + "\nEmail: " + email +
        "\nInterest: " + interest + "\nPage: " + page + "\n\nMessage:\n" + message +
        "\n\n- Sent from Your Pathway Home website"
      );
      window.location.href = "mailto:tvaldez@axenrealty.com?subject=" + subject + "&body=" + body;

      setTimeout(function () {
        window.location.href = form.getAttribute("data-thanks") || "thank-you.html";
      }, 400);
    });

    form.setAttribute("data-started", String(Date.now()));
  });

  var y = document.getElementById("year");
  if (y) y.textContent = String(new Date().getFullYear());
})();
