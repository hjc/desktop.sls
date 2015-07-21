# Contributing Guidelines

## Getting Started Developing

Coming soon.

## Code Conventions

### `require`

A package should never require a source, a source should always do a require-in

## Code Style

### `include`'s

All `include` statements should come at the top of a file.

##### Yes

```
include:
  - core.foo.bar
  
foo.bar.baz:
  pkg.latest
```

##### No

```
foo.bar.baz:
  pkg.latest
  
include:
  - core.foo.bar
```

All `include` paths should use a dot, never a slash.

##### Yes

```
include:
  - core.foo.bar
```

##### No

```
include:
  - core/foo/bar
```

All `include` statements should be in alphabetical order.

##### Yes

```
include:
  - core.a.b
  - core.b.x
  - core.z.a
```

##### No

```
include:
  - core.b.x
  - core.z.a
  - core.a.b
```

### Module State/Names

Be short, but descriptive. Use all lowercase, use dashes (`-`) instead of
underscores (_).

##### Yes

```
user-in-sudo
```

##### No

```
SUDO
```

### Other File Names

* For any sort of managed file, make the file in the repo have the exact same
name as the managed file would. If you get to pick this name, prefer dashes
(`-`) over underscores (`_`) always. Remember to consider using numeric priorities
in your file names!


* When creating a sample file, e.g., sample pillar data, use the `.sample` 
"file extension" before the real extension.

##### Yes

```
salt/pillar/apps/default.sample.sls
```

##### No

```
salt/pillar/apps/default-sample.sls
```
