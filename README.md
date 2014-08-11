pi-dnetc Cookbook
=================
Intalls the [distributed.net](http://distributed.net) client on your Raspberry Pi.

Requirements
------------
Raspberry Pi :-)

Attributes
----------

#### pi-dnetc::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pi-dnetc']['OGR-28']</tt></td>
    <td>Boolean</td>
    <td>whether to run OGR or not</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['pi-dnetc']['RC-72']</tt></td>
    <td>Boolean</td>
    <td>whether to run OGR or not</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### pi-dnetc::default

e.g.
Just include `pi-dnetc` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[pi-dnetc]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Andreas Fritzler

Released under the [Apache License](/LICENSE)
