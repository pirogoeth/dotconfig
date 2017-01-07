# -*- coding: utf-8 -*-

from __future__ import print_function
__metaclass__ = type

def isinstance_filter(obj, typ=object):
    """ Used to provide a simple isinstance() call inside Jinja.

        Example:

            - name: do a thing on a string
              ...
              when: "{{ some_fact | isinstance(str) }}"
    """

    return isinstance(obj, typ)

## -- FILTER LOADER --

class FilterModule(object):
    """ Loader for "Pythonic" core Jinja filters.
    """

    def filters(self):
        return {
            'isinstance': isinstance_filter,
        }
