Vim�UnDo� V��us ܮ:�puq�&�V���SZ�OR���x�r          print n      	      8       8   8   8    _!��   
 _�                             ����                                                                                                                                                                                                                                                                                                                                                             _!��    �                   5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _!�<    �               ;  with concurrent.futures.ThreadPoolExecutor() as executor:5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _!��     �                 import concurrent.futures   import multiprocessing   
import sys   import uuid       def globalize(func):     def result(*args, **kwargs):        return func(*args, **kwargs)   :  result.__name__ = result.__qualname__ = uuid.uuid4().hex   B  setattr(sys.modules[result.__module__], result.__name__, result)     return result       def main():     @globalize     def func1(x):       return x          func2 = globalize(lambda x: x)       &  with multiprocessing.Pool() as pool:   %    print(pool.map(func1, range(10)))   %    print(pool.map(func2, range(10)))       <  with concurrent.futures.ProcessPoolExecutor() as executor:   /    print(list(executor.map(func1, range(10))))   /    print(list(executor.map(func2, range(10))))       if __name__ == '__main__':     main()5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _!��     �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               	global fooB5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               global fooB5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               	5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               	def fooB(q):5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               def fooB(q):5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               		return q**25�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               	return q**25�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               return q**25�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �      	         	pool = mp.Pool()5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �      	         pool = mp.Pool()5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �      
         	ResB_S = map(fooB,range(10))5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �      
         ResB_S = map(fooB,range(10))5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �   	            "	ResB_P = pool.map(fooB,range(10))5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �   
            	pool.close()5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _!��     �               	return ResB_S,ResB_P5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            
                           _!��     �   	            &    	ResB_P = pool.map(fooB,range(10))       	pool.close()       	return ResB_S,ResB_P5�_�                           ����                                                                                                                                                                                                                                                                                                                            
                           _!��     �               ResB_S,ResB_P = bar()5�_�                           ����                                                                                                                                                                                                                                                                                                                            
                           _!��    �                   return ResB_S,ResB_P5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _!�     �                 assert ResB_S==ResB_P5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _!�     �                 assert ResB_S== ResB_P5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _!�&     �      	       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _!�{     �                 import multiprocessing as mp       
def bar():       global fooB           def fooB(q):           return q**2           pool = mp.Pool()        ResB_S = map(fooB,range(10))   %    ResB_P = pool.map(fooB,range(10))       pool.close()       return ResB_S, ResB_P       ResB_S, ResB_P = bar()   assert ResB_S == ResB_P5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _!�|    �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _!��     �                		5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _!��     �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _!��     �               	return q**25�_�                             ����                                                                                                                                                                                                                                                                                                                                                             _!��     �               return q**25�_�      !                       ����                                                                                                                                                                                                                                                                                                                                                             _!��     �               	pool = mp.Pool()5�_�       "           !           ����                                                                                                                                                                                                                                                                                                                                                             _!��     �      	         	ResB_S = map(fooB,range(10))5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                                                             _!��     �      	         x	ResB_S = map(fooB,range(10))5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                                             _!��     �      	         	ResB_S = map(fooB,range(10))5�_�   #   %           $   	        ����                                                                                                                                                                                                                                                                                                                                                             _!��     �      
         "	ResB_P = pool.map(fooB,range(10))5�_�   $   &           %   
        ����                                                                                                                                                                                                                                                                                                                                                             _!��     �   	            	pool.close()5�_�   %   '           &           ����                                                                                                                                                                                                                                                                                                                                                             _!��     �   
            	return ResB_S,ResB_P5�_�   &   (           '           ����                                                                                                                                                                                                                                                                                                                                                             _!��     �      	         ResB_S = map(fooB,range(10))5�_�   '   )           (   	        ����                                                                                                                                                                                                                                                                                                                                                             _!��     �      
         !ResB_P = pool.map(fooB,range(10))5�_�   (   *           )   
        ����                                                                                                                                                                                                                                                                                                                                                             _!��     �   	            pool.close()5�_�   )   +           *           ����                                                                                                                                                                                                                                                                                                                                                             _!��     �   
            return ResB_S,ResB_P5�_�   *   ,           +           ����                                                                                                                                                                                                                                                                                                                                                             _!��     �                 assert ResB_S==ResB_P5�_�   +   -           ,           ����                                                                                                                                                                                                                                                                                                                                                             _!��    �                  �               5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                             _!��    �                   	pool = mp.Pool()5�_�   -   /           .          ����                                                                                                                                                                                                                                                                                                                                                             _!�     �      	              ResB_S = map(fooB,range(10))5�_�   .   0           /      !    ����                                                                                                                                                                                                                                                                                                                                                             _!�    �      	         !    ResB_S = [map(fooB,range(10))5�_�   /   1           0      !    ����                                                                                                                                                                                                                                                                                                                                                             _!�     �      	         "    ResB_S = [map(fooB,range(10))]5�_�   0   2           1          ����                                                                                                                                                                                                                                                                                                                                                             _!�     �      	         !    ResB_S = [map(fooB,range(10))5�_�   1   3           2          ����                                                                                                                                                                                                                                                                                                                                                             _!�     �      	              ResB_S = map(fooB,range(10))5�_�   2   4           3      %    ����                                                                                                                                                                                                                                                                                                                                                             _!�     �      	         %    ResB_S = list(map(fooB,range(10))5�_�   3   5           4           ����                                                                                                                                                                                                                                                                                                                                                             _!��     �                 import multiprocessing as mp       def fooB(q):       return q**2       
def bar():       pool = mp.Pool()   &    ResB_S = list(map(fooB,range(10)))   %    ResB_P = pool.map(fooB,range(10))       pool.close()       return ResB_S,ResB_P       ResB_S,ResB_P = bar()   #assert ResB_S==ResB_P   print(ResB_P, ResB_S)5�_�   4   6           5           ����                                                                                                                                                                                                                                                                                                                                                             _!��   	 �                   5�_�   5   7           6      	    ����                                                                                                                                                                                                                                                                                                                                                             _!��     �                   print n5�_�   6   8           7      	    ����                                                                                                                                                                                                                                                                                                                                                             _!��     �                   print)n5�_�   7               8          ����                                                                                                                                                                                                                                                                                                                                                             _!��   
 �                   print(n5��