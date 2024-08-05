

Simple hello world:
```rust
fn main() {
  println!("Hello world");
}
```

Simple godbolt (https://godbolt.org) example:
```rust
fn factorial_arg(n:u8) -> u64{
    (1..=n).collect::<Vec<u8>>().iter().fold(1 as u64, |acc, x| {*x as u64 * acc})
}

pub fn another_function() -> u64 {
     factorial_arg(8)
}

pub fn main() {
  println!("The answer is: {}", another_function());
}
```

Rust aims to provide memory safety:
```rust
fn rust_is_safe(index:usize) -> u8 {
  let my_array = [1,2,3,4,5];
  my_array[index]
}

pub fn main() {
  println!("Goodbye memory problems? {}", rust_is_safe(20));
}
```

Numeric checks:
```rust

pub fn main() {
  let a:u8 = 160;
  let b:u8 = 180;
  println!("Adding numbers: {}", a + b);
}
```

Numeric checks take 2:
```rust

pub fn addition(a:u8, b:u8) -> u8 { 
  a + b
}

pub fn main() {
  let a:u8 = 160;
  let b:u8 = 180;
  println!("Adding numbers: {}", addition(a, b));
}
```

Enumerations in rust are extremely flexible:

```rust
#[derive(Debug)]
pub struct MyStruct {
    pub value: i32
}

impl MyStruct {
    pub fn new(value: i32) -> Self {
       Self {
         value: value,
       }
    }
}

#[derive(Debug)]
enum MyEnum {
    Blah(MyStruct),
    Number(u8),
    VectorOfNumbers(Vec<u16>),
}


pub fn square(num: i32) -> i32 {
    num * num
}

pub fn check(input:i32) -> i32 {
    let mut x = 0;
    for i in 1..input {
        x += i;
    }
    square(x)
}

// If you use `main()`, declare it as `pub` to see it in the output:
pub fn main() {

    let enum_array = [MyEnum::Number(4),
                      MyEnum::Blah(MyStruct::new(-400)),
                      MyEnum::VectorOfNumbers(vec![2,4,5])];

    for item in enum_array {
      match item {
        MyEnum::Blah(ref s) => {println!("{:?}", s.value);},
        MyEnum::Number(x) => {println!("Number: {}", x);},
        MyEnum::VectorOfNumbers(v) => {println!("Vector Sum: {}", v.iter().fold(1, |x, acc| {x + acc}));},

      }
    }

    let x = MyEnum::Blah(MyStruct::new(-300));
    let y = MyEnum::Number(3);
    println!("{}, {:?}, {:?}", square(70), y, x);

}
```
