[
  '`lm`', 'dru', 'woodrufb', 'ek', 'montgc', 'suroi', 'Rylee', 'jruby', 'brokes', 'sha512sum',
  'cbgbt', 'khwain', 'waleedk', 'gmackie', 'aji', 'LCM', 'ianweller', 'suscd', 'reed', '^', 't_t'
].each do |person|
  Process.spawn("ruby imitator.rb '#{person}'")
end
