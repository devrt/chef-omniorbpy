omniORBpy Cookbook
==================

This cookbook will install omniORBpy a robust high performance CORBA
ORB for Python.

Requirements
------------

- `build-essential` - omniORBpy requires c++ compiler.
- `python` - omniORBpy requires python.
- `omniorb` - omniORBpy requires omniORB.

Attributes
----------

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['omniorbpy']['version']</tt></td>
    <td>String</td>
    <td>which version to install</td>
    <td><tt>3.7</tt></td>
  </tr>
</table>

Usage
-----

Just include `omniorbpy` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[omniorbpy]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Apache 2.0

Author: Yosuke Matsusaka
