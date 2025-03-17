code_block="""if [ -d 'venv' ]; then
    source venv/Scripts/activate
    echo 'Virtual environment activated.'
fi"""

target="$HOME/.bashrc"

if ! grep -q "source venv/Scripts/activate" "$target"; then
    echo "$code_block" >> "$target"
    echo "Auto env code added to '.bashrc'."
else
    echo "Auto env code exists in '.bashrc'. Aborting command."
fi
