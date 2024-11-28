.data
_num_students: .word 0
_id_list: .word 
_credits_list: .word 
_names: .ascii

.align 2
_records: .space 0  # Must be 8 * num_students
_table: .space 20  # Must be 4 * table_size
_table_size: .word 5
_id_to_delete: .word 1264352

.text
main:
# Initialize student records array (same for all test cases)
lw $a0, _num_students
la $a1, _id_list
la $a2, _credits_list
la $a3, _names

addi $sp, $sp, -4
la $t0, _records
sw $t0, 0($sp)

jal init_student_array
addi $sp, $sp, 4

# Populate the table
# T X T T T
la $s1, _table

li $t1, -1
sw $t1, 0($s1)	# Store tombstone value at index 0

li $t1, -1
sw $t1, 8($s1)	# Store tombstone value at index 2

li $t1, -1
sw $t1, 12($s1)	# Store tombstone value at index 3

li $t1, -1
sw $t1, 16($s1)	# Store tombstone value at index 4

# The below file will call the delete function with _id_to_delete
.include "p6_tester.asm"
