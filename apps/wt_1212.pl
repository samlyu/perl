open (IN_OLD, "<wt_1212_old") or die "regression_old_list does not exist";
open (IN_NEW, "<wt_1212_new") or die "regression_new_list does not exist";
@list_old = <IN_OLD>;
close IN_OLD;
@list_new = <IN_NEW>;
close IN_NEW;
@list_total = (@list_old, @list_new);
open (OUT_TOTAL, ">wt_1212_total");
for (my $iter=0;$iter<@list_total;$iter=$iter+1)
{
	print OUT_TOTAL $list_total[$iter];
}
close OUT_TOTAL;
