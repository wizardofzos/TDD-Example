import unittest
from example import foo, bar

class TestFunctions(unittest.TestCase):
    def test_foo_returns_sum(self):
        """Test normal generation of ClusterName"""
        f = foo(1,1) 
        self.assertEquals(f,2)

if __name__ == '__main__':
    unittest.main()
