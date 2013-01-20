#!/bin/bash
watch -n 1 "(echo status; sleep 0.1) | nc 127.0.0.1 4730"
