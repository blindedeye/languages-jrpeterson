## Exam One Review

### Models of Computation

- VonNeumann Architecture (Classical Computation)
  - CPU, RAM, Process Layout (Text, Globals, Heap, Stack(down)).
  - Main Event for Programming Languages
- Neural Network
  - Directed graph of weighted edges with a transfer function.
  - Leading Nodes (no edges going in) are input and given data.
  - sum weights of all nodes leading to that node, and then pass that value through the transfer function
    T(sum(weights*inputs to that node))
  - ML amounts to designing the graph and optimizing the weights.
- Probabalistic (Classical & Neural Network)
  - x = 3 with prob .7 and 82 with prob .3 ...
  - Quantum Computer (crack keys)

### Categories of Languages

- Procedural
- Functional
- Cosntraints / Logic
- Object Oriented

Many Languages are combinations of these ^^^

- When is procedural programming style a good idea?

- Why is functional programming style popular in web apps?

- What is the basic syntax of CSS?

- What is the purpose of HTML? What kind of language is it?

- Why is SQL a logic/constraints language?

- Why are logic languages used for user interfaces?

- Why are general purpose languages used to write machine learning models?

- Convert this procedural program into functional style:
```
double sum_powers(int a, int b, int p) {
    double sum = 0;
    for (int i = a; i <= b; ++i) {
        sum += pow(i,p);
    }
    return a;
}
```

- Why do side effects break functional programming style?






Throw this into my notes:
Object Orientation

-> maps to human cognition (4+-1 attention)

-> Concepts

Object-Based Programming
  ```
  class Pencil : Public WritingInstrument {
    Color color; // Property
    void write(...){...} // Method
  }

  ```
  - Pencil is a kind of writing instrument
  - Writing Instr. -> Pencil : Single Inheritance
  - Writing Instr. (color, write, etc.)
  - Pencil(color, write, etc.)
```
  class Pencil : Public WritingInstrument : Public Projectile {
    Color color; // Property
    void write(...){...} // Method
  }

```
  - Writing Instr. -> Pencil && Projectile -> Pencil : Multiple Inheritance

  Diamond of Death Picture (fixed with virtual inheritance)

  Interfaces
  - adding features for single inheritance without messing up inheritance diagram
  -



Object Oriented Programming