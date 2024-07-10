defmodule MaxLymanWeb.ProjectLinkComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <li class="mb-10">
      <div>
        <a href={@link} class="text-xl font-bold text-white hover:text-gray-300  flex flex-row items-end">
          <img
            src={@image}
            class="h-12 w-12"
          />
          <div class="pl-2">
            <p>
              <%= @title %>
            </p>
            <p>
              <%= @description %>
            </p>
            <hr class="border-2 border-white w-full hover:border-gray-300"/>
          </div>
        </a>
      </div>
    </li>
    """
  end
end
