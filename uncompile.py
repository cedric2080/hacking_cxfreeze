import uncompyle6
with open('./library/test_main_reverse_eng.py', 'w') as f:
    uncompyle6.decompile_file('./library/test__main__.pyc', f)