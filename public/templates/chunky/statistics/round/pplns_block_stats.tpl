<article class="module width_full">
  <header><h3>Round Statistics</h3></header>
  <table class="tablesorter">
    <tbody>
      <tr>
        <td align="left">
          <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&height={$BLOCKDETAILS.height}&prev=1"><i class="icon-left-open"></i></a>
        </td>
        <td align="right" colspan="4">
          <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&height={$BLOCKDETAILS.height}&next=1"><i class="icon-right-open"></i></a>
        </td>
      </tr>
    </tbody>
  </table>
  <table class="tablesorter">
    <tbody>
     <thead>
      <tr>
        <th align="center" colspan="2">Block Statistics</th>
        <th align="center" colspan="2">PPLNS Round Statistics</th>
      </tr>
     </thead>
      <tr class="odd">
        <td>ID</td>
        <td>{$BLOCKDETAILS.id|number_format:"0"|default:"0"}</td>
        <td>PPLNS Shares</td>
        <td>{$PPLNSSHARES|number_format:"0"|default:"0"}</td>
      </tr>
      <tr class="even">
        <td>Height</td>
	{if ! $GLOBAL.website.blockexplorer.disabled}
      	<td><a href="{$GLOBAL.website.blockexplorer.url}{$BLOCKDETAILS.blockhash}" target="_new">{$BLOCKDETAILS.height|number_format:"0"|default:"0"}</a></td>
	{else}
      	<td>{$BLOCKDETAILS.height|number_format:"0"|default:"0"}</td>
	{/if}
        <td>Estimated Shares</td>
        <td>{$BLOCKDETAILS.estshares|number_format|default:"0"}</td>
      </tr>
      <tr class="odd">
        <td>Amount</td>
        <td>{$BLOCKDETAILS.amount|default:"0"}</td>
        <td>Target Variance</td>
{assign var=percentage value=0}
{assign var=percentage1 value=0}
{assign var=percentage2 value=0}
        <td>{if $PPLNSSHARES > 0}{math assign="percentage" equation=(($BLOCKDETAILS.estshares / $PPLNSSHARES) * 100)}{/if}<span class="{if ($percentage >= 100)}green{else}red{/if}">{$percentage|number_format:"2"} %</span></td>
      </tr>
      <tr class="even">
        <td>Confirmations</td>
        <td>{if $BLOCKDETAILS.confirmations >= $GLOBAL.confirmations}
          <span class="green">Confirmed</span>
        {else if $BLOCKDETAILS.confirmations == -1}
          <span class="red">Orphan</span>
        {else if $BLOCKDETAILS.confirmations == 0}0
        {else}{($GLOBAL.confirmations - $BLOCKDETAILS.confirmations)|default:"0"} left{/if}</td>
        <td>Block Average</td>
        <td>{$BLOCKAVERAGE|number_format:"0"|default:"0"}</td>
      </tr>
      <tr class="odd">
        <td>Difficulty</td>
        <td>{$BLOCKDETAILS.difficulty|default:"0"}</td>
        <td>Average Efficiency</td>
        <td>{if $BLOCKAVERAGE > 0 && $BLOCKDETAILS.estshares > 0}{math assign="percentage2" equation=(($BLOCKDETAILS.estshares / $BLOCKAVERAGE) * 100)}{/if}<span class="{if ($percentage2 >= 100)}green{else}red{/if}">{$percentage2|number_format:"2"} %</span></td>
      </tr>
      <tr class="even">
        <td>Time</td>
        <td>{$BLOCKDETAILS.time|default:"0"}</td>
        <td>Target Rounds</td>
        <td>{$BLOCKAVGCOUNT|number_format:"0"|default:"0"}</td>
      </tr>
      <tr class="odd">
        <td>Shares</td>
        <td>{$BLOCKDETAILS.shares|number_format:"0"|default:"0"}</td>
        <td>Seconds This Round</td>
        <td>{$BLOCKDETAILS.round_time|number_format:"0"|default:"0"}</td>
      </tr>
      <tr class="even">
        <td>Finder</td>
        <td>{substr($BLOCKDETAILS.finder, 0, strlen($BLOCKDETAILS.finder) - rand(1, 3))|escape}{substr(md5($BLOCKDETAILS.finder), 0, 5)}***</td>
        <td>Round Variance</td>
        <td>{if $PPLNSSHARES > 0}{math assign="percentage1" equation=(($BLOCKDETAILS.shares / $PPLNSSHARES) * 100)}{/if}<span class="{if ($percentage1 >= 100)}green{else}red{/if}">{$percentage1|number_format:"2"} %</span></td>
      </tr>
    </tbody>
  </table>
  <footer>
    <div class="submit_link">
      <form action="{$smarty.server.PHP_SELF}" method="POST" id='search'>
        <input type="hidden" name="page" value="{$smarty.request.page|escape}">
        <input type="hidden" name="action" value="{$smarty.request.action|escape}">
        <input type="text" class="pin" name="search" value="{$smarty.request.height|default:"%"|escape}">
        <input type="submit" value="Search" class="alt_btn">
      </form>
    </div>
  </footer>
</article>