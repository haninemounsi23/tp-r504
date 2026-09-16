	

def puissance(a,b):
	if not type(a) is int or not type(b) is int :
		raise TypeError("Only integers are allowed")
	else :

 		res = 1

        for i in range(b):

            res = res * a
        
		return res

