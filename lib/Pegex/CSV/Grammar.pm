package Pegex::CSV::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'share/csv.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.57)
  {
    '+toprule' => 'csv',
    'ALL' => {
      '.rgx' => qr/\G[\s\S]/
    },
    'csv' => {
      '+min' => 0,
      '.ref' => 'row'
    },
    'row' => {
      '.all' => [
        {
          '+asr' => 1,
          '.ref' => 'ALL'
        },
        {
          '+max' => 1,
          '.all' => [
            {
              '.ref' => 'value'
            },
            {
              '+min' => 0,
              '-flat' => 1,
              '.all' => [
                {
                  '.rgx' => qr/\G[\ \t]*,/
                },
                {
                  '.ref' => 'value'
                }
              ]
            }
          ]
        },
        {
          '.rgx' => qr/\G[\ \t]*(?:\r?\n|\r|\z)/
        }
      ]
    },
    'value' => {
      '.rgx' => qr/\G[\ \t]*([\ \t]*"(?:(?:""|[^"])*)"|[\ \t]*(?:[^,"\r\n]*[^\ \t,"\r\n])?)/
    }
  }
}

1;
