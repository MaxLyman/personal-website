defmodule MaxLymanWeb.Landing.BikeAnimation do
  use MaxLymanWeb, :live_component

  require Logger

  def mount(socket) do
    {:ok, socket}
  end


  def render(assigns) do
    direction = assigns.direction || "right-to-left"
    animation_number = assigns.animation_number || "1"

    scroll = assigns.scroll

    id = "bike-animation-#{animation_number}"
    image = case direction do
      "right-to-left" -> "/images/rtl-road-bike.png"
      "left-to-right" -> "/images/ltr-road-bike.png"
      _ -> {:error, "Invalid direction"}
    end

    padding = case direction do
      "right-to-left" -> "pl-80"
      "left-to-right" -> "pr-80"
      _ -> {:error, "Invalid direction"}
    end

    if scroll do
      render_with_scroll(assigns, id, image, padding)
    else
      render_without_scroll(assigns, id, image, padding)
    end


  end

  def handle_event("scroll-event", id, padding, ride_direction, socket) do
    {:noreply, socket}
  end

  defp render_without_scroll(assigns, id, image, padding) do
    Logger.info("Rendering without scroll")

    ride_direction = case assigns.direction do
      "right-to-left" -> "scrolling-div-rtl"
      "left-to-right" -> "scrolling-div-ltr"
      _ -> {:error, "Invalid direction"}
    end
    # this is the dynamic part of the template
    ~H"""
      <div id={"#{id}"} class={"#{padding} #{ride_direction}"}>
        <div class="w-24 h-24">
          <img
            class={"w-24 h-24"}
            src={"#{image}"}
            alt="bike"/>
        </div>
      </div>
    """
  end


  defp render_with_scroll(assigns, id, image, padding) do
    Logger.info("Rendering with scroll")
    Logger.info(id)
    ~H"""
      <div class="overflow-hidden">
        <div id={"#{id}"} class={"#{padding}"}>
          <div class="w-24 h-24">
            <img
              class="w-24 h-24"
              src={"#{image}"}
              alt="bike"/>
          </div>
        </div>
        <script>

          window.addEventListener("scroll", function() {
            var bike = document.getElementById("bike-animation-1");
            var parent = bike.parentElement;
            var scroll = window.scrollY;
            var direction = "#{direction}";
            var translation = direction === "right-to-left" ? scroll/2 : -scroll/2;
            console.log("direction", direction); //THIS DOESNT WORK direction isnt being passed in and defaults to -scroll/2 which for now is fine
            bike.style.transform = "translateX(" + translation + "px)";
          });
        </script>
      </div>
    """
  end
end
