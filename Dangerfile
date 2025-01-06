analyze_report_path = "flutter_analyze_report.txt"

if File.exist?(analyze_report_path)
  report_content = File.read(analyze_report_path)
  
  if report_content.include?("No issues found!")
    message("Flutter analyze succeeded with no issues.")
  else
    warn("Flutter analyze report contains warnings or errors. Please review the details below.")
    markdown("### Flutter Analyze Report\n\n```\n#{report_content}\n```")
  end
else
  message("Flutter analyze report not found.")
end
