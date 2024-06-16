defmodule MaxLymanWeb.Landing.BikeAnimation do
  use MaxLymanWeb, :live_component

  require Logger

  def mount(socket) do
    Logger.info("socket #{inspect(Map.keys(socket))}")

    {:ok, socket}
  end


  def render(assigns) do
    Logger.info("assigns #{inspect(assigns)}")
    direction = assigns.direction || "right-to-left"
    animation_number = assigns.animation_number || "1"

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

    ride_direction = case direction do
      "right-to-left" -> "scrolling-div-rtl"
      "left-to-right" -> "scrolling-div-ltr"
      _ -> {:error, "Invalid direction"}
    end


    assigns =
      assigns
      |> Map.put(:id, id)
      |> Map.put(:image, image)
      |> Map.put(:padding, padding)
      |> Map.put(:tailwind_class, "#{padding} #{ride_direction}")



    if assigns.scroll do
      render_with_scroll(assigns)
    else
      render_without_scroll(assigns)
    end


  end

  defp render_without_scroll(assigns) do
    Logger.info("Rendering without scroll")

    # this is the dynamic part of the template
    ~H"""
      <div id={@id} class={@tailwind_class}>
        <div name="bike">
          <div class="w-24 h-24">
            <img
              name="bike_img"
              src={@image}
              class={"w-24 h-24"}
              alt="bike"/>
          </div>
        </div>
      </div>
    """
  end


  defp render_with_scroll(assigns) do
    Logger.info("Rendering with scroll")
    ~H"""
     <div>
        <div class="overflow-hidden">
          <div id="bike-div" phx-hook="BikeAnimation" data-direction="rtl" class={@padding}>
            <div class="w-24 h-24" >
              <img
                id="bike-image"
                src="/images/rtl-road-bike.png"
                class="w-24 h-24"
                alt="bike"/>
            </div>
          </div>
        </div>
     </div>
    """
  end
end
