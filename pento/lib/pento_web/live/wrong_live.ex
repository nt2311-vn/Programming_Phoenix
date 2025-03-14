defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    time = time()
    random_number = Enum.random(1..10)

    {
      :ok,
      assign(socket, score: 0, message: "Guest a number.", time: time, answer: random_number)
    }
  end

  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
      It's <%= @time %>
    </h2>

    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number={ n }><%= n %></a>
      <% end %>
    </h2>
    """
  end

  def time() do
    DateTime.utc_now() |> to_string
  end

  def handle_event("guess", %{"number" => guess_str}, socket) do
    guess = guess_str |> String.to_integer()
    answer = socket.assigns.answer
    score = socket.assgins.score

    if guess == answer do
      new_answer = Enum.random(1..10)

      {:noreply,
       assign(socket,
         message: "Correct ! The number was #{answer}.",
         score: score + 1,
         answer: new_answer,
         time: time()
       )}
    else
      new_score = if score > 0, do: score - 1, else: 0

      {:noreply,
       assign(socket,
         message: "Wrong! Your guest number was #{answer}, try again!",
         score: new_score,
         time: time()
       )}
    end
  end
end
