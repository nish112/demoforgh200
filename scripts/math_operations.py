import sys
import os

def calculate_sum(a, b):
    return a + b

if __name__ == "__main__":
    # Ensure the output directory exists
    os.makedirs("output", exist_ok=True)
    
    val1 = int(sys.argv[1]) if len(sys.argv) > 1 else 10
    val2 = int(sys.argv[2]) if len(sys.argv) > 2 else 20
    
    result = calculate_sum(val1, val2)
    print(f"Calculating: {val1} + {val2} = {result}")
    
    with open("output/result.txt", "w") as f:
        f.write(str(result))
