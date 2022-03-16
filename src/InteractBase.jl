module InteractBase

using WebIO, OrderedCollections, Observables, CSSUtil, Colors, JSExpr, Memoize
import Observables: ObservablePair, AbstractObservable
import JSExpr: JSString
using Random
using Dates
using Base64: stringmime
using JSON
using Knockout
using Knockout: js_lambda
using Widgets
import Widgets:
    observe,
    AbstractWidget,
    div,
    Widget,
    widget,
    widgettype,
    @layout!,
    components,
    input,
    spinbox,
    textbox,
    textarea,
    autocomplete,
    datepicker,
    timepicker,
    colorpicker,
    checkbox,
    toggle,
    filepicker,
    opendialog,
    savedialog,
    slider,
    rangeslider,
    rangepicker,
    button,
    dropdown,
    radiobuttons,
    checkboxes,
    toggles,
    togglebuttons,
    tabs,
    entry,
    latex,
    alert,
    highlight,
    notifications,
    confirm,
    togglecontent,
    tabulator,
    accordion,
    mask,
    tooltip!,
    wdglabel,
    slap_design!,
    @manipulate,
    manipulatelayout,
    triggeredby,
    onchange

using RelocatableFolders

import Observables: throttle

export observe, Widget, widget

export @manipulate

export filepicker, opendialog, savedialog, datepicker, timepicker, colorpicker, spinbox

export autocomplete, input, dropdown, checkbox, textbox, textarea, button, toggle, togglecontent

export slider, rangeslider, rangepicker

export radiobuttons, togglebuttons, tabs, checkboxes, toggles

export latex, alert, confirm, highlight, notifications, accordion, tabulator, mask

export onchange

export settheme!, resettheme!, gettheme, availablethemes, NativeHTML

export slap_design!

abstract type WidgetTheme<:Widgets.AbstractBackend; end
struct NativeHTML<:WidgetTheme; end

folder_dir = @path joinpath(@__DIR__, "..")
@memoize font_awesome() = joinpath(folder_dir, "assets", "all.js")
@memoize prism_js() = joinpath(folder_dir, "assets", "prism.js")
@memoize prism_css() = joinpath(folder_dir, "assets", "prism.css")
@memoize highlight_css() = joinpath(folder_dir, "assets", "highlight.css")
@memoize nouislider_min_js() = joinpath(folder_dir, "assets", "nouislider.min.js")
@memoize nouislider_min_css() = joinpath(folder_dir, "assets", "nouislider.min.css")
@memoize style_css() = joinpath(folder_dir, "assets", "style.css")

include("classes.jl")
include("backends.jl")
include("utils.jl")
include("input.jl")
include("slider.jl")
include("optioninput.jl")
include("layout.jl")
include("output.jl")
include("modifiers.jl")

function __init__()
    if Widgets.get_backend() === Widgets.DummyBackend()
        Widgets.set_backend!(NativeHTML())
    end
end

end # module
