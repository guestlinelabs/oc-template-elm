# WORK IN PROGRESS [NOT READY FOR PRODUCTION]

# oc-template-elm

[Elm](https://elm-lang.org) template for the [OpenComponents](https://github.com/opentable/oc) template system

---

## Packages included in this repo

| Name                                                             | Version                                                                                                                     |
| ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| [`oc-template-elm`](/packages/oc-template-elm)                   | [![npm version](https://badge.fury.io/js/oc-template-elm.svg)](http://badge.fury.io/js/oc-template-elm)                     |
| [`oc-template-elm-compiler`](/packages/oc-template-elm-compiler) | [![npm version](https://badge.fury.io/js/oc-template-elm-compiler.svg)](http://badge.fury.io/js/oc-template-typescript-elm) |

## Usage:

Initialize a component with the oc-template-react and follow the CLI instructions

```
$ npx oc init my-awesome-oc oc-template-elm
$ cd my-awesome-oc
$ npm install
```

## Ports

Your Elm component will have access to two ports by default, if you want to use them.

```elm
-- To do a oc.getData request passing your properties
port requestData : E.Value -> Cmd msg

-- A listener after the oc.getData request finishes. It will be up to you to decode errors you may get.
port dataReceiver : (E.Value -> msg) -> Sub msg
```

## Missing features

- Server side rendering
- Having JS as the entry point (for ports and custom elements)
