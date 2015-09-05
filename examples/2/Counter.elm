-- creating a module that can later be imported/referenced in Main.elm as "import Counter exposing (update, view)"
module Counter (Model, init, Action, update, view) where

-- our imports
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick, onMouseOver)


-- MODEL
-- our model is just an integer. You can see this in Main.elm being set to 0
type alias Model = Int

-- this wasn't in the first tutorial, but needed (added!) for the second
init : Int -> Model
init count = count

-- UPDATE
-- defining we can only do 2 actions, increment and decrement
type Action = Increment | Decrement

-- our update function takes an action and a model and returns a model (?)
-- this is just setting up the type
update : Action -> Model -> Model

-- this is where the real definition starts
-- case statement is yucky for OO people like me
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1


-- VIEW
-- again, just setting up the types (?)
-- this Signal stuff is weird
view : Signal.Address Action -> Model -> Html

-- everything is sent to an address
view address model =
  div []
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick address Increment ] [ text "+" ]
    ]
-- when the button on click is pressed, data (?) is passed to address (?)

-- CSS stuff
countStyle : Attribute
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]
