defmodule Newsletter do
   def read_emails(file_path), do:  File.read!(file_path) |> String.split(~r/\n/, trim: true)
    
   def open_log(file_path), do:  File.open!(file_path, [:write])
    
   def log_sent_email(pid, email), do: IO.puts(pid, email)

   def close_log(pid), do: File.close(pid)

   def send_newsletter(emails_path, log_path, send_fun) do
      log_pid = open_log(log_path)
      emails_path|> read_emails()|> Enum.each(&if send_fun.(&1) == :ok, do: log_sent_email(log_pid, &1))
      close_log(log_pid)
   end
end
