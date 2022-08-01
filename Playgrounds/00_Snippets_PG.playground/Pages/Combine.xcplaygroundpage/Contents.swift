//: [Previous](@previous)

/*:
 [Combine Framework](https://www.avanderlee.com/swift/combine/)
 Combine allows you to write functional reactive code by providing a declarative Swift API. Functional Reactive Programming (FRP) languages allow you to process values over time. Examples of these kinds of values include network responses, user interface events, and other types of asynchronous data.

 In other words, a FRP sequence could be described as follows:

 Once a network response is received
 I want to map it’s data to a JSON model
 And assign it to my View.
 
 
 - Publishers are the same as Observables
 - Subscribers are the same as Observers
 Different namings, but they both give the same understanding. A Publisher exposes values that can change on which a subscriber subscribes to receive all those updates. Keep this in mind while we go over some Publishers’ examples in the Foundation framework while working with Combine.
 
 
 The Foundation framework and Combine
 The Foundation framework contains a lot of extensions to work with Combine. It allows you to use Publishers from common types you’re already familiar with. Examples include:

 A URLSessionTask Publisher that publishes the data response or request error
 Operators for easy JSON decoding
 A Publisher for a specific Notification.Name that publishes the notification

 */



import Foundation
import Combine

 extension Notification.Name {
     static let newBlogPost = Notification.Name("new_blog_post")
 }

 struct BlogPost {
     let title: String
     let url: URL
 }

// publisher will listen for incoming notifications for the newBlogPost notification name. However, this will only happen as soon as there is a subscriber.
 let blogPostPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil)
//: [Next](@next)
