# Automata Theory and Theory of Computation

This repository contains comprehensive material for studying automata theory, formal languages, and computational theory. It includes course materials, assignments, presentations, videos, and reference books.

## 📚 Repository Structure

### 1-Material/

Complete course materials organized by weeks and topics:

- **Week 1-6**: Weekly homework assignments, presentations, and video lectures
- **Challenge Problems**: Advanced problems with visual representations using Graphviz
- **Problem Sessions**: Video sessions with subtitles and presentation materials
- **Programming Assignments**: PA1 and PA2 with instructions and source code in Java and Python
- **Final_Exam.pdf**: Final examination material

### 2-Books/

Essential textbooks and reference materials:

- Foundations of Computer Science - Aho & Ullman (with solutions)
- Introduction to the Theory of Computation - Sipser (2nd and 3rd editions)
- Introducción a la Teoría de Autómatas, Lenguajes y Computación - Hopcroft, Motwani & Ullman
- TikZ and PGF Manual for LaTeX graphics

### 3-Software/

Tools for automata visualization and design:

- **JFLAP.jar**: Java Formal Languages and Automata Package
- **JFLAP8_beta.jar**: Beta version of JFLAP

### 4-Tools/

Utility scripts and automation tools:

- **compress_videos.sh**: Script for compressing MP4 video files to optimize repository size

### 5-Certification/

- Coursera Automata certification (2015)

## 🔧 Tools and Technologies

- **JFLAP**: For designing and testing automata, grammars, and Turing machines
- **Graphviz**: For creating visual representations of automata (.gv files)
- **LaTeX**: For mathematical documentation and problem solutions
- **Java/Python**: Programming assignments implementation
- **FFmpeg**: Video compression tool (used by automation scripts)

## 🚀 Getting Started

### Prerequisites

- Java Runtime Environment (for JFLAP)
- LaTeX distribution (TeX Live, MiKTeX, etc.)
- Graphviz (for .gv file visualization)
- Python 3.x or Java 8+ (for programming assignments)

### Running JFLAP

```bash
java -jar 3-Software/JFLAP.jar
```

### Compiling LaTeX Documents

```bash
pdflatex document_name.tex
```

### Generating Graphviz Images

```bash
dot -Tpng filename.gv -o filename.png
```

### Using Project Tools

The repository includes automation scripts in the `4-Tools/` directory:

**Video Compression:**

```bash
# Navigate to project root and run compression script
cd /path/to/Automata
bash 4-Tools/compress_videos.sh
```

This script automatically compresses all MP4 files in the project to optimize repository size while maintaining acceptable quality.

## 📖 Course Topics Covered

- **Finite Automata**: DFA, NFA, ε-NFA
- **Regular Languages**: Regular expressions, pumping lemma
- **Context-Free Languages**: CFG, PDA, parsing
- **Turing Machines**: TM variants, decidability
- **Complexity Theory**: P, NP, NP-completeness
- **Computability Theory**: Undecidability, reduction

## 🎯 Key Features

- **Interactive Learning**: JFLAP files for hands-on automata design
- **Visual Representations**: Graphviz diagrams for better understanding
- **Multiple Formats**: Problems available in various formats (PDF, LaTeX, JFLAP)
- **Programming Practice**: Practical implementations in Java and Python
- **Video Resources**: Recorded problem sessions with subtitles

## 📝 File Formats

- **.jff**: JFLAP automata files
- **.gv**: Graphviz dot files for automata visualization
- **.tex**: LaTeX source files for mathematical documentation
- **.pdf**: Compiled documents and presentations
- **.mp4/.srt**: Video lectures with subtitles

## 🤝 Contributing

This is an educational repository. Feel free to:

- Report issues with existing materials
- Suggest improvements to documentation
- Share additional resources or solutions

## 📄 License

This repository contains educational materials. Please respect copyright for textbooks and course materials.

---

This repository serves as a comprehensive resource for understanding automata theory and computational complexity.
