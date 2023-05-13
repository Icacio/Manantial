if object_index != tabla with tabla return match();
if (argument_count == 0) {
    if is_array(_match) return (_match[0]&&_match[1]) else
    return _match;
    
}
if (argument_count == 1) {
    if (argument[0] == -1) return _match[0];
    if (argument[0] == -2) return _match[1];
    _match = argument[0];
}
else {
    _match[0] = argument[0];
    _match[1] = argument[1];
    
}
