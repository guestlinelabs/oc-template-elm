module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Decode as D
import Json.Encode as E


-- MAIN

main : Program E.Value Model Msg
main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = { name : String, email: String }

init : E.Value -> ( Model, Cmd Msg )
init flags =
  (
    case D.decodeValue decoder flags of
      Ok model -> model
      Err _ -> { name = "", email = "" }
  ,
    Cmd.none
  )
-- UPDATE

type Msg = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
  ( model, Cmd.none )


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input
        [ type_ "text"
        , placeholder "Name"
        , value model.name
        ]
        []
    , input
        [ type_ "text"
        , placeholder "Email"
        , value model.email
        ]
        []
    ]


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none

decoder : D.Decoder Model
decoder =
  D.map2 Model
    (D.field "name" D.string)
    (D.field "email" D.string)