## Versions

### v0.1

* Basic setup with required files
* Implementation of `hashmap`, `fibonacci_heap`, `stack` and `queue`
* Registration
* Vignette

#### v0.1.1

* Fixes typos in vignette

### v0.2

* Adds `binomial_heap` and `bimap`
* Overhaul to testing suite
* Introduced abstract super classes: `heap`, `map` and `deque`
* Constructor methods for classes to replace call to `new`
* Removed `initialize` methods that broke copy construction contract
* Several fixes

#### v0.2.1

* Adds vectorial values for `hashmap`, `fibonacci_heap`, `binomial_heap`, `stack` and `queue`
* Adds more unit tests and examples

#### v0.2.2

* Adds `decrease_key` and `handle` methods for heap.
* Adds tests for these two methods.
* Updates vignette.

#### v0.2.3

* Adds `handles_value` functions for heaps.

#### v0.2.4

* Removes `binomial_heap` and `fibonacci_heap` implementations and replaces with `heap` template class.
* Adds `value` method for heaps.
* Replaces hashs for storing `value` in heaps with linear search to make it conformab;e with introduction of data frame and other data structures.
