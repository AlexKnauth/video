#lang racket

#|
   Copyright 2016-2017 Leif Andersen

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
|#

(require rackunit
         (prefix-in file: file/convertible)
         "../private/video.rkt")

(let ()
  (define-constructor new-video #f ())
  (define-constructor new-sub new-video ([hello #f]))
  (define-constructor sub-sub new-sub ([world #f]))
  (check-true
   (sub-sub?
    (make-sub-sub #:hello "HI"
                  #:world "YOU")))
  (check-false (file:convert (make-new-video) 'mlt)))