# Property Wrappers
## Sources

[SwiftUI Property Wrappers](https://www.raywenderlich.com/21522453-swiftui-property-wrappers)



@State - Alerts a View that a variable changed
					- @State wrappers are usually used in ViewModels

					
@Binding

@Environment


@StateObject

@ObservedObject

@EnvironmentObject

@Published - Same thing as @State but in a class
							- 

| Value Types | Object Types |
|-------------|----------------|
| @State | @StateObject|
| @Binding | @ObservedObject |
| @Environment | @EnvironmentObject | 
| @environmet | @environmentObject |


### Property Wrappers
Property wrappers wrap a value or object in a structure with two properties:

Property wrappers wrap a value or object in a structure with two properties:
-   `wrappedValue` is the underlying value or object.
-   `projectedValue` is a binding to the wrapped value or a projection of the object that creates bindings to its properties.

Swift syntax lets you write just the name of the property, like `showAddThing`, instead of `showAddThing.wrappedValue`. And, its binding is `$showAddThing`instead of `showAddThing.projectedValue`.

SwiftUI provides property wrappers and other tools to create and modify the single source of truth for values and for objects:

-   User interface _values_: Use `@State` and `@Binding` for values like `showAddThing` that affect the view’s appearance. The underlying type must be a _value_ type like `Bool`, `Int`, `String` or `Thing`. Use `@State` to create a source of truth in one view, then pass a `@Binding` to this property to subviews. A view can access built-in `@Environment` values as `@Environment`properties or with the `.environment(_:_:)` view modifier.
-   Data model _objects_: For objects like `ThingStore` that model your app’s data, use `@StateObject` with `@ObservedObject` or `.environmentObject(_:)` with `@EnvironmentObject`. The underlying object type must be a _reference_ type — a class — that conforms to `ObservableObject`, and it should _publish_ at least one value. Then, either use `@StateObject` and `@ObservedObject` or declare an `@EnvironmentObject` with the same type as the environment object created by the `.environmentObject(_:)` view modifier.

While prototyping your app, you can model your data with structures and use `@State` and `@Binding`. When you’ve worked out how data needs to flow through your app, you can refactor your app to accommodate data types that need to conform to `ObservableObject`.

There are two other property wrappers, which manage the state of the app or scene. `@AppStorage` wraps `UserDefaults` values and you can use `@SceneStorage` to save and restore the state of a scene.

### Managing UI State Values
`@State` and `@Binding` value properties are mainly used to manage the state of your app’s user interface.

**A view is a structure, so you can’t change a property value unless you wrap it as a `@State` or `@Binding` property.**

The view that owns a `@State` property is responsible for initializing it. The `@State` property wrapper creates persistent storage for the value outside the view structure and preserves its value when the view redraws itself. This means initialization happens exactly once.

####  Managing ThingStore with @State and @Binding
Manage `ThingStore` the same way as any other mutable _value_ you share between your app’s views.


### State
A `@State` property is a _source of truth_. A view that owns a `@State` property can pass either its value or its binding to its subviews. If it passes a binding to a subview, the subview now has a _reference_ to the source of truth. This allows it to update that property’s value or redraw itself when that variable changes. When a `@State` value changes, any view with a reference to it invalidates its appearance and redraws itself to display its new state.

