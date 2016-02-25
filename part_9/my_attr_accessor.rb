# module MyModule
#   def attr_accessor_with_history(*names)
#   	names.each do |name|
#       var_name = ("@#{name}").to_sym
#       define_method(name) {instance_variable_get(var_name)}
#       define_method("#{name}=".to_sym) do |value|
#         instance_variable_set(var_name,value)
#         variable_history[instance_variable_get(var_name)] ||= []
#         variable_history[var_name] << value
#       end
#     end
#   end
#   define_method("#{name}_history") {instance_variable_get(variable_history)}
# end

# class A
# 	extend MyModule
# 	attr_accessor_with_history :d, :l

# end

# a = A.new
# a.l = 4
# p a.l_history


 module Accessor
   def self.included(base)
     base.extend ClassMethods
     base.send :include, InstanceMethods
   end
 
   module ClassMethods
     def attr_accessor_with_history(*names)
       names.each do |name|
         var_name = "@#{name}".to_sym
         variable_history = []
         define_method(name) { instance_variable_get(var_name) }
         define_method("#{name}_history") {instance_variable_get(:variable_history)}
         define_method("#{name}=".to_sym) do |value|
           instance_variable_set(var_name, value)
           # variable_history[var_name] ||= []
           variable_history << value
         end
       end
     end
   end
 
   module InstanceMethods
     # def variable_history
     #   @variable_history ||= {}
     # end
     # define_method("#{name}_history") {instance_variable_get(variable_history)}

     # def method_missing(name)
     #   if name.to_s.split('_')[-1] == 'history'
     #     variable = "@#{name.to_s.split('_')[0..-2].join('_')}".to_sym
     #     raise NoMethodError, 'Method is absent' unless variable_history[variable]
     #     variable_history[variable]
     #   else
     #     raise NoMethodError, 'Method is absent'
     #   end
     # end
   end
 end

class A
	include Accessor
	attr_accessor_with_history :d, :l

end

a = A.new
a.l = 4
p a.l_history
p a.public_methods
